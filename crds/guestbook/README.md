Create a project and an Api:
```
kubebuilder init --domain my.domain --repo my.domain/guestbook
kubebuilder create api --group webapp --version v1 --kind Guestbook
```

Make and install CRDs:
```
make manifests
make install
```

Run the controller controllers/guestbook_controller.go:
```
make run
```

Install instances of custom resources
```
kubectl apply -f config/samples/
```

Run it on the cluster:
```
make docker-build docker-push IMG=<some-registry>/<project-name>:tag
make deploy IMG=<some-registry>/<project-name>:tag
```

Uninstall:
```
make uninstall
make undeploy
```

